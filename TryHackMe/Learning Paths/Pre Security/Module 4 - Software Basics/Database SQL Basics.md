# Database SQL Basics

**Module:** Software Basics

## Key Points

- A **database** stores structured data; **relational databases** organise it into tables (rows and columns).
- **SQL (Structured Query Language)** is used to interact with them.
- Core statements:
  - `SELECT ... FROM table` — read data (`SELECT * FROM users`).
  - `WHERE` — filter rows.
  - `INSERT INTO` — add rows.
  - `UPDATE ... SET` — modify rows.
  - `DELETE FROM` — remove rows.
- Understanding SQL is essential for **SQL injection**, where attacker input is inserted into a query to manipulate it.

## Remember

Tables = rows + columns. SELECT/INSERT/UPDATE/DELETE. Unsanitised input into a query = SQL injection.
