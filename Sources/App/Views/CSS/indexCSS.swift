let indexCSS: StaticString = """
:root {
    --bg: #faf8f3;
    --bg-raised: #f2efe6;
    --fg: #2a2723;
    --fg-secondary: #4a443b;
    --fg-dim: #7a7568;
    --accent: #c1743a;
    --accent-soft: rgba(193, 116, 58, 0.45);
    --line: rgba(42, 39, 35, 0.12);
    --serif: "Newsreader", Georgia, "Times New Roman", serif;
    --sans: "Inter", -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
    --mono: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;
    --measure: 680px;
    --gutter: clamp(20px, 5vw, 64px);
}

* {
    box-sizing: border-box;
}

html {
    background: var(--bg);
    scroll-behavior: smooth;
}

body {
    font-family: var(--sans);
    margin: 0;
    background: var(--bg);
    color: var(--fg);
    -webkit-font-smoothing: antialiased;
}

::selection {
    background-color: rgba(193, 116, 58, 0.22);
}

/* ---------- Page frame ---------- */

.site-header,
main,
.site-footer {
    max-width: calc(var(--measure) + 2 * var(--gutter));
    margin: 0 auto;
    padding-inline: var(--gutter);
}

.site-header {
    padding-block: 32px 0;
}

main {
    padding-block: clamp(40px, 8vw, 72px) 56px;
}

main > :first-child {
    margin-top: 0;
}

.back-button {
    font-family: var(--sans);
    font-size: 0.75rem;
    font-weight: 500;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    color: var(--fg-dim);
    text-decoration: none;
}

.back-button:hover {
    color: var(--accent);
}

.site-footer {
    padding-block: 0 96px;
}

.site-footer p {
    font-family: var(--sans);
    margin: 0;
    padding-top: 40px;
    border-top: 1px solid var(--line);
    font-size: 0.8rem;
    line-height: 1.6;
    color: var(--fg-dim);
}

/* ---------- Typography ---------- */

h1,
h2,
h3,
h4,
h5,
h6 {
    font-family: var(--serif);
    font-weight: 500;
    line-height: 1.15;
    letter-spacing: -0.01em;
    color: var(--fg);
    margin-top: 2.5rem;
    margin-bottom: 1rem;
}

h1 {
    font-size: clamp(2.25rem, 6vw, 3.25rem);
    margin-bottom: 1.5rem;
}

h2 {
    font-size: clamp(1.75rem, 4vw, 2.25rem);
    margin-top: 3.5rem;
}

h3 {
    font-size: 1.5rem;
}

h4 {
    font-size: 1.25rem;
}

/* Posts open with `### Title` then `#### Date` */
main > h3:first-child {
    font-size: clamp(2rem, 5vw, 2.75rem);
    margin-bottom: 14px;
}

main > h3:first-child + h4 {
    font-family: var(--sans);
    margin: 0 0 2rem;
    font-size: 0.75rem;
    font-weight: 500;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    color: var(--fg-dim);
}

p,
dl,
ol,
ul {
    font-family: var(--serif);
    font-size: clamp(1.1rem, 1.4vw, 1.2rem);
    line-height: 1.65;
    margin-top: 1.1em;
    margin-bottom: 1.1em;
}

ol,
ul {
    padding-left: 1.4em;
}

li + li {
    margin-top: 0.35em;
}

strong {
    font-weight: 600;
}

blockquote {
    margin: 2.5em 0;
    padding-left: 20px;
    border-left: 2px solid var(--accent);
    font-style: italic;
    color: var(--fg-secondary);
}

blockquote footer {
    font-family: var(--sans);
    font-size: 0.8rem;
    font-style: normal;
    text-align: right;
    color: var(--fg-dim);
}

a {
    color: inherit;
    text-decoration: underline;
    text-decoration-color: var(--accent-soft);
    text-decoration-thickness: 1px;
    text-underline-offset: 3px;
}

a:hover {
    color: var(--accent);
}

hr {
    border: none;
    border-top: 1px solid var(--line);
    margin: 2rem 0;
}

code {
    font-family: var(--mono);
    font-size: 0.85em;
    padding: 0.1em 0.3em;
    border-radius: 3px;
    background: var(--bg-raised);
}

pre {
    margin: 1.75rem 0;
    padding: 1rem 1.25rem;
    overflow-x: auto;
    border-radius: 4px;
    font-size: 0.9rem;
    line-height: 1.5;
}

pre code {
    padding: 0;
    font-size: inherit;
}

img {
    max-width: 100%;
}

figcaption {
    font-family: var(--sans);
    font-size: 0.8rem;
    color: var(--fg-dim);
}

.marginnote,
.sidenote {
    float: right;
    clear: right;
    font-size: 0.95rem;
    line-height: 1.3;
    margin-right: -10%;
    position: relative;
}

.subtitle {
    font-style: italic;
    font-size: 1.5rem;
    color: var(--fg-secondary);
    margin: 1rem 0;
}

.newthought {
    font-variant: small-caps;
    font-size: 1.2em;
}

.container {
    width: 100%;
    max-width: 1024px;
    margin: auto;
    padding: 0 1rem;
}

.divider {
    border: none;
    height: 1px;
    background-color: var(--line);
    margin: 2.5rem 0;
}

/* ---------- Subscribe form ---------- */

.subscribe form {
    display: flex;
    flex-wrap: wrap;
    gap: 0.75rem;
    align-items: center;
    margin-top: 1.5rem;
    max-width: 480px;
}

.subscribe input[type="email"] {
    font-family: var(--sans);
    flex: 1 1 240px;
    padding: 0.65rem 0.9rem;
    font-size: 1rem;
    color: var(--fg);
    background: #fff;
    border: 1px solid var(--line);
    border-radius: 4px;
}

.subscribe input[type="email"]:focus {
    outline: none;
    border-color: var(--accent);
}

.subscribe input[type="submit"] {
    font-family: var(--sans);
    padding: 0.65rem 1.2rem;
    font-size: 1rem;
    font-weight: 500;
    border: none;
    border-radius: 4px;
    background: var(--fg);
    color: var(--bg);
    cursor: pointer;
    transition: background 0.2s ease;
}

.subscribe input[type="submit"]:hover {
    background: var(--accent);
}

.subscribe .privacy-link {
    font-family: var(--sans);
    flex: 0 0 100%;
    font-size: 0.8rem;
    color: var(--fg-dim);
}

/* ---------- Section break ---------- */

.section-break {
    text-align: center;
    font-size: 1.4rem;
    letter-spacing: 0.5em;
    color: var(--fg-dim);
    margin: 2rem 0;
}

/* ---------- Screenshot rows ---------- */

.screenshot-row {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
    justify-content: center;
    margin: 2rem 0;
}

.screenshot-row img {
    flex: 1 1 0;
    min-width: 100px;
    max-width: 200px;
    border-radius: 16px;
    box-shadow: 0 6px 20px rgba(42, 39, 35, 0.1);
}

/* ---------- Motion ---------- */

@media (prefers-reduced-motion: reduce) {
    html {
        scroll-behavior: auto;
    }
}

"""
