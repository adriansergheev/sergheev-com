let howLongCSS: StaticString = """
:root {
    --surface: #fff;
    --on-accent: var(--fg);
    box-sizing: border-box;
    padding-top: env(safe-area-inset-top, 0px);
    padding-bottom: env(safe-area-inset-bottom, 0px);
}

html {
    height: 100%;
    scroll-padding-top: env(safe-area-inset-top, 0px);
}

*,
*::before,
*::after {
    box-sizing: border-box;
}

body {
    margin: 0;
    height: 100%;
    background: var(--bg);
    color: var(--fg);
    font-family: var(--serif);
    font-size: 1.125rem;
    line-height: 1.62;
    display: grid;
    grid-template-rows: 1fr auto;
    -webkit-font-smoothing: antialiased;
}

main {
    overflow-y: auto;
    overflow-x: hidden;
    min-height: 0;
}

/* stays in the corner of every slide */
.draft {
    position: fixed;
    top: calc(env(safe-area-inset-top, 0px) + 0.75rem);
    right: 0.75rem;
    z-index: 1;
    padding: 0.2rem 0.55rem;
    border-radius: 8px;
    background: var(--fg);
    color: var(--bg);
    font-family: var(--sans);
    font-size: 0.7rem;
    font-weight: 500;
    line-height: 1.4;
    letter-spacing: 0.12em;
    text-transform: uppercase;
}

/* ---------- Slides: only the targeted one is shown (intro when no hash) ---------- */

.slide {
    display: none;
    max-width: 46rem;
    margin: 0 auto;
    padding: clamp(1.5rem, 5vw, 3.5rem) 1.25rem 3rem;
}

.slide:target,
body:not(:has(.slide:target)) #intro {
    display: block;
}

.slide:focus {
    outline: none;
}

h1,
h2 {
    font-family: var(--serif);
    font-weight: 500;
    margin: 0;
}

figure {
    margin: 0 0 1.5rem;
}

.photo {
    display: block;
    aspect-ratio: 16 / 9;
    max-height: 30vh;
    width: 100%;
    border-radius: 16px;
    background-color: color-mix(in srgb, var(--accent) 12%, var(--surface));
    object-fit: contain;
}

figcaption {
    font-family: var(--sans);
    font-size: 0.75rem;
    color: var(--fg-dim);
    margin-top: 0.4rem;
}

figcaption a {
    color: inherit;
}

h1 {
    font-size: clamp(2.6rem, 8vw, 4.6rem);
    line-height: 1.02;
    letter-spacing: -0.01em;
    margin-bottom: 1.5rem;
    max-width: 14ch;
}

p {
    margin: 0 0 1rem;
    max-width: 62ch;
}

.year {
    font-size: clamp(2.75rem, 10vw, 4.25rem);
    line-height: 1;
    letter-spacing: -0.02em;
    color: var(--accent);
    font-variant-numeric: tabular-nums;
    margin-bottom: 1.25rem;
}

.question {
    font-size: clamp(1.5rem, 4.5vw, 2rem);
    font-weight: 500;
    line-height: 1.15;
    margin: 2rem 0 1rem;
    letter-spacing: -0.01em;
}

/* ---------- Choices: radio buttons + labels as cards ---------- */

.options {
    position: relative;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(15rem, 1fr));
    gap: 0.9rem;
    align-items: start;
}

.options input {
    position: absolute;
    opacity: 0;
    width: 1px;
    height: 1px;
    pointer-events: none;
}

.opt {
    display: block;
    cursor: pointer;
    background: var(--surface);
    color: var(--fg);
    border: 2px solid var(--line);
    border-radius: 20px;
    padding: 1.1rem 1.25rem 1.2rem;
    transition: transform 0.25s cubic-bezier(0.2, 0.8, 0.2, 1), background 0.2s, border-color 0.2s, opacity 0.25s;
}

.opt:hover {
    border-color: var(--fg);
}

.opt-label {
    display: block;
    font-size: 1.6rem;
    font-weight: 500;
    line-height: 1.15;
}

.opt-detail {
    display: block;
    font-size: 1rem;
    line-height: 1.45;
    margin-top: 0.35rem;
    color: var(--fg-dim);
}

input:focus-visible + .opt {
    outline: 3px solid var(--accent);
    outline-offset: 3px;
}

/* answered: lock taps, dim the other card, tilt the picked one */
.options:has(:checked) .opt {
    pointer-events: none;
    opacity: 0.45;
}

.options:has(:checked) input:checked + .opt {
    opacity: 1;
    border-color: var(--fg);
    transform: rotate(-1.5deg) translateY(-4px);
}

/* what humanity chose is filled in, whether it was picked or not */
.options:has(:checked) input + .opt.correct {
    opacity: 1;
    background: var(--accent);
    border-color: var(--accent);
    color: var(--on-accent);
}

.options:has(:checked) .opt.correct .opt-detail {
    color: var(--on-accent);
}

/* ---------- Reveal + next, shown once a choice is made ---------- */

.reveal,
.after {
    display: none;
}

.slide:has(.options :checked) .reveal {
    display: block;
    animation: flip 0.5s 0.35s cubic-bezier(0.2, 0.8, 0.2, 1) both;
    transform-origin: top center;
}

.slide:has(.options :checked) .after {
    display: block;
    animation: fade 0.3s 0.6s both;
}

@keyframes flip {
    from {
        opacity: 0;
        transform: perspective(900px) rotateX(-14deg) translateY(-8px);
    }
    to {
        opacity: 1;
        transform: none;
    }
}

@keyframes fade {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

.reveal {
    margin-top: 2rem;
    padding: 1.5rem 1.4rem 1.6rem;
    border-radius: 24px;
    background: color-mix(in srgb, var(--accent) 16%, var(--surface));
}

.objection {
    font-family: var(--sans);
    font-size: 0.75rem;
    font-weight: 500;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    color: var(--fg-dim);
    margin: 0 0 0.6rem;
}

.verdict {
    font-size: clamp(1.5rem, 4.5vw, 2rem);
    font-weight: 500;
    line-height: 1.15;
    margin: 0 0 1rem;
    letter-spacing: -0.01em;
}

.cite,
.source {
    font-family: var(--sans);
}

.cite {
    font-size: 0.8em;
    color: inherit;
    text-underline-offset: 3px;
    vertical-align: super;
    line-height: 0;
}

.source {
    display: block;
    font-size: 0.9rem;
    color: var(--fg-dim);
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    max-width: 100%;
}

.reveal .source {
    margin-top: 1.25rem;
}

.actions {
    margin-top: 1.75rem;
}

.next {
    width: 64px;
    height: 64px;
    border-radius: 50%;
    background: var(--fg);
    color: var(--bg);
    display: grid;
    place-items: center;
}

.next svg {
    width: 26px;
    height: 26px;
}

a:focus-visible {
    outline: 3px solid var(--accent);
    outline-offset: 3px;
}

/* ---------- Timeline ---------- */

.timeline {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.6rem 1rem 0.9rem;
    background: var(--bg);
    border-top: 1.5px solid var(--line);
}

.back {
    flex: none;
    width: 44px;
    height: 44px;
    border-radius: 50%;
    border: 2px solid var(--line);
    color: var(--fg);
    display: none;
    place-items: center;
}

.back svg {
    width: 18px;
    height: 18px;
}

.back.disabled {
    display: grid;
    opacity: 0.3;
    pointer-events: none;
}

body:has(.slide:target) .back.disabled {
    display: none;
}

.track {
    position: relative;
    flex: 1;
    height: 52px;
    margin: 0 1.75rem;
}

.rail,
.fill {
    position: absolute;
    left: 0;
    top: 50%;
    height: 3px;
    border-radius: 3px;
    transform: translateY(-50%);
}

.rail {
    right: 0;
    background: var(--line);
}

.fill {
    width: 0;
    background: var(--fg);
    transition: width 0.6s cubic-bezier(0.2, 0.8, 0.2, 1);
}

.tl-node {
    position: absolute;
    top: 50%;
    transform: translate(-50%, -50%);
    min-width: 3.1rem;
    height: 1.9rem;
    padding: 0 0.45rem;
    display: grid;
    place-items: center;
    border-radius: 8px;
    border: 2px solid var(--line);
    background: var(--surface);
    color: var(--fg-dim);
    font-family: var(--sans);
    font-size: 0.8rem;
    font-weight: 500;
    text-decoration: none;
    transition: background 0.25s, border-color 0.25s, transform 0.25s;
}

@media (max-width: 520px) {
    body {
        font-size: 1.05rem;
    }

    .opt-label {
        font-size: 1.4rem;
    }

    .tl-node {
        min-width: 2.8rem;
        font-size: 0.75rem;
    }
}

/* ---------- Motion ---------- */

@media (prefers-reduced-motion: reduce) {
    * {
        animation: none !important;
        transition: none !important;
    }
}

"""
