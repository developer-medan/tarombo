# Design System Document: Cultural Modernism

## 1. Overview & Creative North Star: "The Ancestral Ledger"

This design system is built to bridge the gap between ancient lineage and future-forward technology. Our Creative North Star is **"The Ancestral Ledger"**—a digital experience that feels less like a database and more like a high-end editorial archive. 

We break the "template" look by rejecting the rigid, centered grids of standard apps. Instead, we utilize **intentional asymmetry**, where content flows organically like a family tree. By combining the stark, authoritative weight of Maroon and Charcoal with the ethereal lightness of Bone White, we create a "Cultural Modernism" that respects the gravity of Batak Toba history while providing a frictionless mobile experience.

---

## 2. Colors: Tonal Depth & The No-Line Rule

We move beyond flat UI by utilizing a sophisticated layering of surfaces. The palette is grounded in the deep history of the Batak people, using tonal shifts rather than structural lines to define space.

### The "No-Line" Rule
**Explicit Instruction:** Designers are prohibited from using 1px solid borders to section off content. Boundaries must be defined solely through background color shifts. Use `surface_container_low` sections sitting on a `surface` background to create distinction.

### Surface Hierarchy & Nesting
Treat the UI as a series of physical layers. Each container uses a slightly higher or lower tier to define its importance:
*   **Base:** `surface` (#f9f9f9) – The primary canvas.
*   **Secondary Sections:** `surface_container_low` (#f3f3f3) – For subtle grouping.
*   **Elevated Cards:** `surface_container_highest` (#e2e2e2) – For interactive elements.

### Glass & Gradient Rule
To provide a "signature" feel, floating navigation elements must use **Glassmorphism**: 
*   **Background:** `surface` at 80% opacity.
*   **Effect:** `backdrop-blur: 20px`.
*   **Gradients:** Main CTAs should transition from `primary` (#570000) to `primary_container` (#800000) at a 135-degree angle to provide a velvet-like depth.

---

## 3. Typography: The Editorial Scale

We use **Inter** to maintain a clean, modernist look. The hierarchy is designed to highlight the "Sundut" (Generation) and the individual’s name as the primary focal points.

*   **Display (Names in Hero):** `display-md` (2.75rem). Bold. Use for the patriarch/matriarch of a view.
*   **Headline (Names in Cards):** `headline-sm` (1.5rem). Bold. High contrast against `surface`.
*   **Title (Sundut/Generation):** `title-sm` (1rem). Medium weight. Often paired with `tertiary` (#735c00) to signify prestige.
*   **Body (Details):** `body-md` (0.875rem). Standard readability for birth dates and locations.
*   **Label (Metadata):** `label-sm` (0.6875rem). All-caps with 0.05em tracking for a "curated archive" feel.

---

## 4. Elevation & Depth: Tonal Layering

Traditional shadows are often "muddy." We replace them with **Tonal Layering** and **Ambient Light**.

*   **The Layering Principle:** Depth is achieved by stacking. Place a `surface_container_lowest` card on a `surface_container_low` section. The contrast creates a soft, natural lift.
*   **Ambient Shadows:** For floating action buttons or menus, use extra-diffused shadows: `box-shadow: 0 12px 32px rgba(90, 65, 61, 0.08)`. The shadow is tinted with `on_surface_variant` to feel integrated, not "pasted on."
*   **The Ghost Border Fallback:** If a border is required for accessibility, use the `outline_variant` token at **20% opacity**. Never use 100% opaque borders.

---

## 5. Components: Bespoke Artifacts

### Genealogy Tree (The Lineage Line)
Forget thin, grey lines. Lineage connections must be **high-contrast**. 
*   **Stroke:** 2px width.
*   **Color:** `primary` (#570000) for direct patrilineal lines. 
*   **Secondary Lineage:** `outline` (#8e706c) with a dashed pattern.

### Modern Ancestry Cards
*   **Background:** `surface_container_highest`.
*   **Corner Radius:** `xl` (0.75rem).
*   **Visual Motif:** A subtle, low-opacity (5%) **Gorga motif** watermark in the bottom-right corner of the card using the `primary` color.
*   **Rule:** No dividers. Separate biographical data using 16px of vertical whitespace.

### Interaction Elements
*   **Buttons (Primary):** `primary_container` (#800000) background with `on_primary` (#ffffff) text. Use the `md` (0.375rem) roundedness for a sharp, sophisticated look.
*   **Chips (Status/Lineage):** Use `tertiary_fixed` (#ffe088) with `on_tertiary_fixed` (#241a00) for markers like "Direct Descendant" or "Boru."
*   **Input Fields:** Ghost-style inputs. No bottom line. Use `surface_container_high` with a 4px `xl` bottom-radius to suggest a "ledger" entry.

---

## 6. Do’s and Don’ts

### Do:
*   **Embrace Asymmetry:** Let the tree grow naturally. Avoid perfectly centered layouts; use left-aligned typography to mimic editorial magazines.
*   **Use the Gold Sparingly:** `tertiary` (#735c00) and `tertiary_container` (#cba72f) are for "prestige" moments (e.g., highlighting a significant ancestor or a verified lineage marker).
*   **Layer for Depth:** Always ask "Can I use a background color change instead of a line?"

### Don’t:
*   **Don't use 1px Dividers:** They clutter the "Cultural Modernism" aesthetic. Use white space (`1.5rem` or `2rem`) to separate generations.
*   **Don't use Pure Black Shadows:** Always tint shadows with the `on_surface_variant` tone to keep the "Bone White" and "Maroon" feeling premium.
*   **Don't Over-decorate:** The Gorga motifs should be "whispered," not "shouted." They are accents, not the main content.