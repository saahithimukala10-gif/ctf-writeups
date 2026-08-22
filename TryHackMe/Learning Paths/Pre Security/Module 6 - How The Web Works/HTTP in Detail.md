# HTTP in Detail

**Module:** How The Web Works

## Key Points

- **HTTP (HyperText Transfer Protocol)** is the protocol browsers and servers use to exchange web content; **HTTPS** is HTTP encrypted with TLS/SSL.
- Requests have a method, path, headers, and optionally a body:
  - **GET** — retrieve a resource (no body).
  - **POST** — submit data to be processed (has a body).
  - **PUT** — replace a resource.
  - **DELETE** — remove a resource.
- Responses include a **status code**:
  - **2xx** — success (200 OK).
  - **3xx** — redirection (301 Moved Permanently, 302 Found).
  - **4xx** — client error (404 Not Found, 403 Forbidden, 401 Unauthorized).
  - **5xx** — server error (500 Internal Server Error).
- **Headers** carry metadata for both requests and responses (e.g. `Content-Type`, `Cookie`, `User-Agent`, `Authorization`).
- HTTP is stateless by default — **cookies** and **sessions** are how sites remember a user across requests.

## Remember

GET reads, POST submits. 2xx = success, 3xx = redirect, 4xx = your fault, 5xx = server's fault. HTTPS = HTTP + TLS encryption.
