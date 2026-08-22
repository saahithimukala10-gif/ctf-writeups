# OSI Model

**Module:** Network Fundamentals

## Key Points

- The **OSI Model** is a 7-layer conceptual framework describing how data moves through a network, from raw bits to application data.
- Layers (bottom to top), with what each is responsible for:
  1. **Physical** — raw bits over a physical medium (cables, radio signals, voltages).
  2. **Data Link** — frames, MAC addresses, switches operate here.
  3. **Network** — logical addressing (IP) and routing between networks; routers operate here.
  4. **Transport** — end-to-end delivery, reliability; TCP (reliable) vs UDP (fast, no guarantee).
  5. **Session** — establishing/managing/ending sessions between two hosts.
  6. **Presentation** — data formatting/translation, encryption, compression (e.g. SSL/TLS conceptually sits here).
  7. **Application** — closest to the user; the protocols apps actually use (HTTP, FTP, DNS, etc.).
- Mnemonic (bottom-up): "**P**lease **D**o **N**ot **T**hrow **S**ausage **P**izza **A**way".
- Each layer only talks to the layer directly above/below it; data gets wrapped in headers as it goes down (encapsulation) and unwrapped going up (decapsulation).

## Remember

7 layers, bottom to top: Physical, Data Link, Network, Transport, Session, Presentation, Application. Switches = Layer 2, Routers = Layer 3, TCP/UDP = Layer 4.
