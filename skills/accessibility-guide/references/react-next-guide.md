## Framework-Specific: React / Next.js (RX1-RX4)

### RX1: Missing `htmlFor` on `<label>`

- **Severity**: IMPORTANT
- **Detection**: `<label.*for="` in JSX (should be `htmlFor`)
- **WCAG**: 1.3.1 (A), 3.3.2 (A)

### RX2: SPA Route Change Without Focus Management

- **Severity**: IMPORTANT
- **Detection**: Navigation without focus management or live region
- **WCAG**: 4.1.3 (AA)

After route change, focus the main heading or announce the new page title via a live region. Next.js includes a built-in route announcer (since v13) that reads `document.title`, then `<h1>`, then pathname. Ensure every page has a unique `<title>`.

### RX3: Fragment Root Causing Focus Loss on Re-render

- **Severity**: SUGGESTION
- **Detection**: `<>...</>` root with conditional rendering causing DOM restructuring
- **WCAG**: 2.4.3 (A)

Use `key` prop to preserve DOM identity, or manually restore focus with `useRef` + `useEffect`.

### RX4: Injected HTML Without ARIA Consideration

- **Severity**: IMPORTANT
- **Detection**: Rich text rendering without accessibility validation
- **WCAG**: 1.3.1 (A)

Sanitize and validate injected HTML for heading hierarchy, alt text, and ARIA structure.
