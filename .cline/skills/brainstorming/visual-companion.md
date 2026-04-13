# Visual Companion Guide

Browser-based companion for mockups, diagrams, and visual comparisons during brainstorming.

## When to Use

Use the browser only when visual output improves understanding.

Use browser for:
- UI mockups and layout comparisons
- Architecture/data-flow diagrams
- Side-by-side visual options

Use terminal for:
- requirements and scope questions
- conceptual tradeoffs
- text-first technical decisions

## How It Works

The server watches a content directory and serves the newest HTML file.

- write screens into `screen_dir`
- browser interactions are appended to `state_dir/events`
- read events on the next turn and combine with terminal feedback

## Starting a Session

```bash
scripts/start-server.sh --project-dir /path/to/project
```

The startup response includes:
- `url`
- `screen_dir`
- `state_dir`

Use the project root in `--project-dir` so files persist under `.superpowers/brainstorm/`.

If your environment kills detached processes, run with `--foreground` and launch it using your environment's background execution option.

If browser cannot reach localhost from your environment:

```bash
scripts/start-server.sh \
  --project-dir /path/to/project \
  --host 0.0.0.0 \
  --url-host localhost
```

## The Loop

1. Ensure server is alive (`state_dir/server-info` exists).
2. Write a new HTML file into `screen_dir`.
3. Tell user what to review and ask for terminal feedback.
4. On next turn, read `state_dir/events` and merge with terminal message.
5. Iterate with a new file name each revision.
6. When returning to text-only discussion, push a simple waiting screen.

## Writing Content Fragments

Default to fragments, not full documents. The server wraps fragments with the frame template.

```html
<h2>Which layout works better?</h2>
<p class="subtitle">Consider readability and hierarchy</p>

<div class="options">
  <div class="option" data-choice="a" onclick="toggleSelect(this)">
    <div class="letter">A</div>
    <div class="content">
      <h3>Single Column</h3>
      <p>Focused reading flow</p>
    </div>
  </div>
  <div class="option" data-choice="b" onclick="toggleSelect(this)">
    <div class="letter">B</div>
    <div class="content">
      <h3>Two Column</h3>
      <p>Sidebar plus main content</p>
    </div>
  </div>
</div>
```

## CSS Classes Available

- `.options`, `.option`, `.letter`, `.content`
- `.cards`, `.card`, `.card-image`, `.card-body`
- `.mockup`, `.mockup-header`, `.mockup-body`
- `.split`
- `.pros-cons`, `.pros`, `.cons`
- `.subtitle`, `.section`, `.label`

## Events Format

Events in `state_dir/events` are JSONL.

```jsonl
{"type":"click","choice":"a","text":"Option A","timestamp":1706000101}
{"type":"click","choice":"b","text":"Option B","timestamp":1706000115}
```

Use final selection plus click history to infer confidence and hesitation.

## File Naming

- Use semantic names: `layout.html`, `layout-v2.html`
- Never reuse a filename in the same session

## Cleaning Up

```bash
scripts/stop-server.sh $SESSION_DIR
```

## Reference

- `scripts/frame-template.html`
- `scripts/helper.js`
