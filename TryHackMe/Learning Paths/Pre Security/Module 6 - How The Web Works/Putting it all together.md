# Putting it all together

**Module:** How The Web Works

## Key Points

- The full journey of typing a URL and getting a page, tying DNS + HTTP + web architecture together:
  1. Browser checks if it already knows the IP (cache); if not, does a **DNS lookup** to resolve the domain to an IP address.
  2. Browser opens a **TCP connection** to that IP (and if HTTPS, performs a **TLS handshake** to encrypt the channel).
  3. Browser sends an **HTTP(S) request** (e.g. `GET /`) to the server.
  4. The **server** (front-end + back-end) processes the request — may query a database, run logic — and returns an **HTTP response** with a status code, headers, and the page content.
  5. The browser **renders** the HTML/CSS/JS into the page the user sees, making further requests as needed (images, scripts, additional API calls).
- Every layer studied so far shows up here: OSI/network layers move the bits, DNS finds the server, TCP/TLS sets up a safe channel, HTTP carries the actual request/response, and the front-end/back-end split determines what gets served.

## Remember

URL → DNS lookup → TCP (+TLS) connection → HTTP request → server processes → HTTP response → browser renders. Every earlier topic is one piece of this one flow.
