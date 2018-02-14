# Cells

Cells allow you to encapsulate parts of your UI into components aka  _view models_. View models, or cells, are simple ruby classes that can render templates. Fast. Very, very fast.

If you are familiar with *React / Vue / Angular components* - you will find Cells very comfortable. It the same idea but for Ruby views.

Cells are battle tested and have been used in production since before React components were but a glimpse in their creator's eyes.

## Overview

Also known as *Decorator* or *View Model* or *View Object* or *View Component* layer - Cells are **functional objects** whose job is to take your model, decorate it, apply a template and produce an HTML string.

<aside class="success">
 Cells are <b>not coupled to any framework</b>. Thus they can be used with <b>any</b> Ruby framework. And can be even used in a <code>pry or irb</code> console. Which makes them really <b>easy to test</b>.
</aside>


## API

## Rendering

## Testing

## Template Engines

Cells supports various template engines.

```ruby
  class SongCell < Cell::ViewModel
    include Cell::Erb
    # or include Cell::Haml
    # or include Cell::Hamlit
    # or include Cell::Slim
```

Out of the box, we provide support for Erb, Slim, Haml and Hamlit. You can also create **your own** bindings to a template engine of your choice if it is supported by [`Tilt` gem](https://github.com/rtomayko/tilt).



In a non-Rails environment, you need to include the respective module into your cells, so it knows what template to find.

<aside class="notice">
Note that you can only include <b>one engine per class</b>. This is due to problems with helpers in Rails and the way they have to be fixed in combination with Cells.
</aside>


### ERB
### Haml
### Hamlit
### Slim

### Custom

```ruby
  class SongCell < Cell::ViewModel
    def template_options_for(options)
      {
        template_class: Tilt, # or Your::Template.
        suffix:         "your"
    }
    end
```
Theoretically, you can use any template engine supported by Tilt.

To activate it in a cell, you only need to override `#template_options_for`.

This will use `Tilt` to instantiate a template to be evaluated. The `:suffix` is needed for Cells when finding the view.

### Multiple Template Engines in Rails

<aside class="warning">
When including more than one engine in your Gemfile in Rails, the last one wins. Since each gem includes itself into <code>Cell::ViewModel</code>, unfortunately there can only be one global engine.
</aside>

Currently, there's no clean way but to disable automatic inclusion from each gem (not yet implemented) and then include template modules into your application cells manually.


Thus it is recommended to to stick to one templating engine, while in Rails.




## Trailblazer::Cell

## Rails
### Troubleshooting

> undefined method `output_buffer=' for #<Comment::Cell:0xb518d8cc>


One of the many problems with Rails helper implementation is that the inclusion order matters. This can lead to problems with the following exception.

```ruby
  # config/initializers/trailblazer.rb

  Cell::Concept.class_eval do
    # include your helpers here.
    include ActionView::Helpers::TranslationHelpers
    include Cell::Erb
    # or Cell::Slim
    # or Cell::Haml
  end
```

Usually, the problem arises when you have initializers to setup your application cell. When including helpers here, they might be included before the `cells` gem has a chance to include its fixes.

Please include your template engine module explicitly then, _after_ your standard helper inclusions.
