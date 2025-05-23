// https://ai-2027.com
let indexCSS: StaticString = """
html {
    font-size: 15px;
    scroll-behavior: smooth;
}

body {
    background-color: #fffff8;
    color: #111;
    line-height: 1.6;
    margin: 40px;
    padding: 0px;
    max-width: 744px;
}

h1,
h2,
h3,
h4,
h5,
h6 {
    font-weight: 400;
    line-height: 1;
    margin-top: 2rem;
    margin-bottom: 1rem;
}

h1 {
    font-size: 3.2rem;
    margin-bottom: 1.5rem;
}

h2 {
    font-size: 2.2rem;
    margin-top: 5rem;
    margin-bottom: 2rem;
}

h3 {
    font-size: 1.7rem;
    font-style: italic;
}

h4 {
    font-size: 1.5rem;
    font-style: italic;
}

p,
dl,
ol,
ul {
    font-size: 1.4rem;
    line-height: 2rem;
    margin-top: 1.4rem;
    margin-bottom: 1.4rem;
}

blockquote {
    font-size: 1.4rem;
    font-style: italic;
    margin: 3em 0;
}

blockquote footer {
    font-size: 1.1rem;
    font-style: normal;
    text-align: right;
}

a {
    color: inherit;
    text-decoration: underline;
    text-decoration-thickness: 1.5px;
    text-underline-offset: 1.5px;
}

hr {
    border-top: 1px solid #ccc;
    margin: 1em 0;
}

figcaption {
    font-size: 1.1rem;
    font-style: italic;
    opacity: 0.654;
}

.marginnote,
.sidenote {
    float: right;
    clear: right;
    font-size: 1.1rem;
    line-height: 1.3;
    margin-right: -10%;
    position: relative;
}

.subtitle {
    font-style: italic;
    font-size: 1.8rem;
    margin: 1rem 0;
}

.newthought {
    font-variant: small-caps;
    font-size: 1.2em;
}

::selection {
    background-color: #cfcfcf;
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
    background-color: #111;
    margin: 20px 0;
}

.back-button {
    cursor: pointer;
    font-size: inherit;
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
    flex: 1 1 240px;
    padding: 0.6rem 0.9rem;
    font-size: 1.2rem;
    border: 1px solid #ccc;
    border-radius: 6px;
}

.subscribe input[type="submit"] {
    padding: 0.6rem 1.2rem;
    font-size: 1.2rem;
    border: none;
    border-radius: 6px;
    background: #111;
    color: #fff;
    cursor: pointer;
    transition: background 0.2s ease;
}

.subscribe input[type="submit"]:hover {
    background: #333;
}

.subscribe .privacy-link {
    flex: 0 0 100%;
    font-size: inherit;
}

@media (max-width: 730px) {

    dl,
    ol,
    ul,
    p {
        font-size: 1.25rem;
        line-height: 1.45;
    }
}
"""
