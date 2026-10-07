FROM ghcr.io/railwayapp-templates/chatwoot@sha256:50d7d83c2ef4bed1b50efdfd2b4ba16d78d44dbd5e30533be61f6dca81e1c303
COPY patch_instagram_postback.rb /tmp/patch_instagram_postback.rb
RUN ruby /tmp/patch_instagram_postback.rb&&rm /tmp/patch_instagram_postback.rb
