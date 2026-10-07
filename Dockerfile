FROM ghcr.io/railwayapp-templates/chatwoot:Community
COPY patch_instagram_postback.rb /tmp/patch_instagram_postback.rb
RUN ruby /tmp/patch_instagram_postback.rb&&rm /tmp/patch_instagram_postback.rb
