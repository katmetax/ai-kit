## Framework-Specific: Vue (VU1-VU3)

### VU1: `@click` on Non-Interactive Element Without Role and Keyboard

- **Severity**: CRITICAL
- **Detection**: `@click` on `<div>` or `<span>` without `role=`, `tabindex`, `@keydown`
- **WCAG**: 2.1.1 (A), 4.1.2 (A)

Use `<button>`. Or add `role="button"`, `tabindex="0"`, `@keydown.enter`, `@keydown.space.prevent`.

### VU2: `v-if` Toggle Without Focus Management

- **Severity**: IMPORTANT
- **Detection**: `v-if` toggling without managing focus via `nextTick`
- **WCAG**: 2.4.3 (A)

```vue
<script setup>
import { ref, watch, nextTick } from 'vue';
const showPanel = ref(false);
const panel = ref(null);
watch(showPanel, async (val) => {
  if (val) { await nextTick(); panel.value?.focus(); }
});
</script>
```

### VU3: `v-html` Injecting Content Without Accessible Structure

- **Severity**: IMPORTANT
- **Detection**: `v-html` rendering user or CMS content
- **WCAG**: 1.3.1 (A)

Sanitize and validate HTML for heading hierarchy, alt text, and ARIA structure before injection.
