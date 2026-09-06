#!/usr/bin/env python3
"""Retry only network/rate-limit audit failures; integrity failures stay fatal."""
import re
import subprocess
import sys
import time


def transient(output):
    if re.search(r'checksum mismatch|SHA-?256 mismatch|signature.*(?:invalid|failed)|attestation.*(?:invalid|failed)|syntax error|rubocop|offenses detected', output, re.I):
        return False
    network = re.search(r'HTTP (?:status code |error )?(?:403|429|500|502|503|504)|curl: \((?:5|6|7|18|28|35|52|56)\)|rate limit|secondary rate', output, re.I)
    # Version disagreement alone is a real audit failure, not a retry condition.
    return bool(network)


def diagnostics():
    result = subprocess.run(['gh', 'api', '--include', 'rate_limit'], capture_output=True, text=True)
    # Emit response metadata only, never request headers, tokens or body content.
    for line in result.stdout.splitlines():
        if re.match(r'^(HTTP/|x-ratelimit-|retry-after:|x-github-request-id:)', line, re.I):
            print('GitHub diagnostic: ' + line, flush=True)
    if result.returncode:
        print('Authenticated GitHub diagnostic failed with exit ' + str(result.returncode), flush=True)


def main():
    for attempt in range(3):
        result = subprocess.run(['brew', 'audit', '--cask', '--strict', '--online', *sys.argv[1:]],
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        print(result.stdout, flush=True)
        if not result.returncode:
            return
        if not transient(result.stdout):
            raise SystemExit(result.returncode)
        diagnostics()
        if attempt == 2:
            raise SystemExit(result.returncode)
        delay = [30, 90][attempt]
        print(f'Transient audit failure; retrying in {delay}s ({attempt + 2}/3)', flush=True)
        time.sleep(delay)


if __name__ == '__main__':
    main()
