"""
Backend for OpenID Connect EGI AAI
https://docs.egi.eu/providers/check-in/sp/#openid-connect-service-provider
"""

from social_core.backends.open_id_connect import OpenIdConnectAuth


class EgiOpenIdConnect(OpenIdConnectAuth):
    name = 'egi'
    OIDC_ENDPOINT = ''
    EXTRA_DATA = [
        ('expires_in', 'expires_in', True),
        ('refresh_token', 'refresh_token', True),
        ('id_token', 'id_token', True),
        ('other_tokens', 'other_tokens', True),
    ]

    DEFAULT_SCOPE = ['openid', 'email']
    JWT_DECODE_OPTIONS = {'verify_at_hash': False}

    def get_user_details(self, response):
        username_key = self.setting('USERNAME_KEY', default=self.USERNAME_KEY)
        name = response.get('name') or ''
        fullname, first_name, last_name = self.get_user_names(name)
        return {'username': response.get(username_key),
                'email': response.get('email'),
                'fullname': fullname,
                'first_name': first_name,
                'last_name': last_name}
