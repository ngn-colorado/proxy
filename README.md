# Temporary Web Proxy for ngn.cs.colorado.edu

Up until January 2016, the server hosting https://ngn.cs.colorado.edu was
setting [HSTS](https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security)
for 1 year. This tells browsers to only ever use the https version of the site
(until the expiration). If we move to static hosting on github.io, then https
isn't supported which means anyone who visited http://ngn.cs.colorado.edu or
https://ngn.cs.colorado.edu recently won't be able to access the github.io page
unless they clean their browser's HSTS cache or wait until the expiration.

So what are we going to do about this?

Two things. First, I set the HSTS header to 1 second instead of 1 year so
anyone who happens to browse the site going forward will be fine. Second, since
there's always a chance that someone received the 1 year header and won't be
back until after the move to github.io, this repo has config for an Apache
proxy to continue supporting https for `ngn.cs.colorado.edu`.

**The backend is currently a temporary github pages repo that I setup, this
needs to be fixed**

**The networking config uses pipework, this or the IP might need to be change
depending on where this will be hosted**
