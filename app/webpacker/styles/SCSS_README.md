# How the markdown is styled

There are two kinds of html in this CMS,  the first is static and we style that in 
the normal way.

The second is dynamically generated html,  produced from markdown. It is this second 
case that is the problem.

## The problem

The GovSpeak gem produces bare HTML, with no class attributes.

But the [Gov Front End package](https://github.com/alphagov/govuk-frontend) assumes
all elements will be decorated with classes.

So if we do nothing, the Editor's markdown will not look like a government web site.

## The answer

We added a parent class called gem-c-govspeak to an element that contains all of the HTML that is produced from
the markdown,

```
          <main id="main-content" class="app-content gem-c-govspeak" role="main">
            <%= yield %>
          </main>
```

The SCSS then includes selectors based on .gem-c-govspeak to apply copies of the normal Gov Front End styles
This is done using @mixin to.  For example see how govspeak/_typography.scss mixes in
govspeak/helpers/_markdown-typography.scss.

```
@import "./helpers/markdown-typography";

// ... edited

.gem-c-govspeak {
  @include markdown-typography;
  
```

## Updating the styles
Because the markdown styling is copied, it will need to be kept in step with the Gov Front End, but
its not likely to change often.

