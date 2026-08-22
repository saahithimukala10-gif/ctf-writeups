# Packets & Frames

**Module:** Network Fundamentals

## Key Points

- Data doesn't travel across a network as one blob — it's broken down and wrapped in headers at each OSI layer as it's sent, and unwrapped as it's received. This is **encapsulation** (sending) and **de-encapsulation** (receiving).
- Names for the data unit change depending on the layer:
  - **Data** — Application/Presentation/Session layers.
  - **Segment** — Transport layer (TCP) / **Datagram** (UDP).
  - **Packet** — Network layer (adds source/destination IP).
  - **Frame** — Data Link layer (adds source/destination MAC address).
  - **Bits** — Physical layer (actual signal sent over the wire/air).
- Each header added contains the info the corresponding layer needs to do its job (e.g. IP header has IP addresses, frame header has MAC addresses).
- On the receiving end, each layer strips its own header and passes the rest up the stack.

## Remember

Data → Segment (TCP)/Datagram (UDP) → Packet (adds IP) → Frame (adds MAC) → Bits. Headers are added going down, stripped going up.
