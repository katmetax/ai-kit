## Framework-Specific: Angular (NG1-NG4)

### NG1: `(click)` on `<div>` Without Role and Keyboard Support

- **Severity**: CRITICAL
- **Detection**: `(click)` on `<div>` or `<span>` without `role=`, `tabindex`, `(keydown)`
- **WCAG**: 2.1.1 (A), 4.1.2 (A)

Use `<button>`. If div required: add `role="button"`, `tabindex="0"`, `(keydown.enter)`, `(keydown.space)`.

### NG2: Missing `cdkTrapFocus` in Modal Components

- **Severity**: IMPORTANT
- **Detection**: Modal components without `cdkTrapFocus`
- **WCAG**: 2.1.2 (A)

```html
<div class="modal" cdkTrapFocus [cdkTrapFocusAutoCapture]="true">...</div>
```

Angular CDK's `Dialog` service handles focus trapping and restoration automatically.

### NG3: Route Change Without LiveAnnouncer

- **Severity**: IMPORTANT
- **Detection**: Angular Router navigation without `LiveAnnouncer`
- **WCAG**: 4.1.3 (AA)

```typescript
router.events.pipe(filter(e => e instanceof NavigationEnd)).subscribe(() => {
  liveAnnouncer.announce(titleService.getTitle(), 'polite');
});
```

### NG4: Template-Driven Forms Without Accessible Validation

- **Severity**: IMPORTANT
- **Detection**: Forms showing errors without `[attr.aria-invalid]` or `[attr.aria-describedby]`
- **WCAG**: 3.3.1 (A), 3.3.3 (AA)

Bind `[attr.aria-invalid]` and `[attr.aria-describedby]` to form control state.
