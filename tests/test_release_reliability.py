import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch
import netrc
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'scripts'))
from audit_with_retry import transient, authenticated_curl_env
from resolve_reconciliation import already_current

class ReliabilityTests(unittest.TestCase):
    def test_generic_curl_auth_is_host_scoped_and_ephemeral(self):
        with patch.dict(os.environ, {'HOMEBREW_GITHUB_API_TOKEN': 'ghs_test-token.with/base64+padding='}):
            with authenticated_curl_env() as env:
                config = Path(env['HOMEBREW_CURLRC'])
                credentials = config.parent / 'netrc'
                parsed = netrc.netrc(str(credentials))
                self.assertEqual(parsed.authenticators('api.github.com'),
                                 ('x-access-token', '', 'ghs_test-token.with/base64+padding='))
                for host in ['github.com', 'release-assets.githubusercontent.com', 'example.com']:
                    self.assertIsNone(parsed.authenticators(host))
                self.assertEqual(credentials.stat().st_mode & 0o777, 0o600)
                self.assertIn('netrc-optional', config.read_text())
                self.assertNotIn('ghs_test-token.with/base64+padding=', config.read_text())
            self.assertFalse(config.exists())
            self.assertFalse(credentials.exists())

    def test_curl_auth_without_token(self):
        with patch.dict(os.environ, {}, clear=True):
            with authenticated_curl_env() as env:
                self.assertNotIn('HOMEBREW_CURLRC', env)

    def test_retry_only_transport_failures(self):
        for text in ['HTTP status code 403', 'HTTP status code 429', 'curl: (28) timeout']:
            self.assertTrue(transient(text))
        for text in ['Version differs from livecheck', 'HTTP status code 401', 'HTTP status code 403 checksum mismatch', 'signature invalid']:
            self.assertFalse(transient(text))

    def test_skip_preserves_newer_beta_but_checks_both_casks(self):
        previous = Path.cwd()
        with tempfile.TemporaryDirectory() as directory:
            try:
                os.chdir(directory)
                Path('Casks').mkdir()
                entry = dict(stable_cask='stable.rb', beta_cask='beta.rb')
                Path('Casks/stable.rb').write_text('  version "0.1.2"\n')
                self.assertFalse(already_current(entry, 'stable', 'v0.1.2'))
                Path('Casks/beta.rb').write_text('  version "0.2.0-beta.1"\n')
                self.assertTrue(already_current(entry, 'stable', 'v0.1.2'))
                self.assertFalse(already_current(entry, 'stable', 'v0.1.3'))
                self.assertTrue(already_current(entry, 'beta', 'v0.2.0-beta.1'))
            finally:
                os.chdir(previous)
