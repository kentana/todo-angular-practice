#!/bin/bash
# build front-example and move to public.

# move to application root.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${SCRIPT_DIR}
cd ../

# move to public.
rm -rf public/front-example

