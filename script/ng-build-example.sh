#!/bin/bash
# build front-example and move to public.

# move to application root.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${SCRIPT_DIR}
cd ../

# build front-example
cd docker
docker-compose run --rm angular npm run build --base-href=/front-example/

# move to public.
cd ..
cp -r front-example/ng/dist public/front-example

# replace relative path.
grep -l 'src="inline' public/front-example/index.html | xargs sed -i.bak -e 's/src="inline/src=".\/front-example\/inline/g'
grep -l 'src="polyfills' public/front-example/index.html | xargs sed -i.bak -e 's/src="polyfills/src=".\/front-example\/polyfills/g'
grep -l 'src="main' public/front-example/index.html | xargs sed -i.bak -e 's/src="main/src=".\/front-example\/main/g'
grep -l 'src="assets' public/front-example/index.html | xargs sed -i.bak -e 's/src="assets/src=".\/front-example\/assets/g'
grep -l 'href="styles' public/front-example/index.html | xargs sed -i.bak -e 's/href="styles/href=".\/front-example\/styles/g'
grep -l 'href="favicon' public/front-example/index.html | xargs sed -i.bak -e 's/href="favicon/href=".\/front-example\/favicon/g'
