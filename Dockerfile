#####################################################################
#                            Build Stage                            #
#####################################################################
FROM hugomods/hugo:exts AS builder

# Build site
COPY . /src
# Build website
RUN hugo --minify

#####################################################################
#                            Final Stage                            #
#####################################################################
FROM hugomods/hugo:nginx
# Copy the generated files to keep the image as small as possible.
COPY --from=builder /src/public /site

