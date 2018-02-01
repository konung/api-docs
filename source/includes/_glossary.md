# Glossary

<aside class="notice">
This is a short <i>non-exhaustive</i> reference, intended to help navigate exciting world of Trailblazer framework.
</aside>

### BPMN
[BPMN](http://www.bpmn.org/) stands for Business Process Model Notation, is a standard for designing business processes and is derived from UML. Trailblazer Activity and Trailblazer Workflow essentially implement BPMN for Ruby as a set of super awesome gems.

### Cells
[View Object / Decorator](#cells) layer / gem of Trailblazer framework. Works with ERB, Haml, Hamlit and Slim templates.

### Concept
>  When using Cells to generate views - **concept() is an alias for cell()**

Basic organizational structure of Trailblazer code, that by convention lives in app/concepts. It helps organize code by **business concept** such as product, client, ticket, rather than by code function such as controller, model, view, etc. In context of TRB can also refer to directory where your specific code lives. Trailblazer Loader relies on this code organization.


### Disposable
[Disposable](https://github.com/apotonick/disposable) gem is part of TRB ecosystem and provides building blocks for many gems in TRB.

### ctx
By convention a first argument in a step. Used to pass context information between steps via Trailblazer::Context object inside an operation.  Before TRB 2.1 it was commonly referred to as **options**.

### Loader
[Trailblazer Loader](https://github.com/trailblazer/trailblazer-loader) is a gem used by trailblazer to load code from app/concepts. Supports 3 directory layouts:
Compound-Singular, Explicit-Singular and Explicit-Plural. Has bindings for Rails, Grape, Roda, Hanami and Sinatra.

### Operation
Service Object layer / gem of Trailblazer framework. Main [element](#operation) of TRB, and is a *Functional Object* on steroids. Since 2.1 it is superset of [Activity](#activity) with some extra features.

### options
See [ctx](#glossary-ctx).

### Railway
* [Railway strategy](#activity-overview) is one of the strategies to handle flow in an activity in TRB 2.1. In TRB 2.0 that was the *only* strategy. Was not present in TRB 1.0/1.1 .
* [Railway oriented programming](https://fsharpforfunandprofit.com/posts/recipe-part2/) is way handle outcome, catch errors and control flow common to functional programming.

### Reform
[Form Object](#reform) layer / gem of Trailblazer framework. Reform 3.0 it is being reworked as [Transform](#transform) gem using new Activity API.

### Result
Result [object](#operation-result) is the product of running an [operation](#operation) since 2.0 . It can be interrogated for the outcome of the operation as well status of the model, params, form, etc.

### Transform
[Transform](#transform) is a Form Object gem that is replacing Reform 3.0

### TRB
Common abbreviation for Trailblazer.

### Twin
[Twin](https://github.com/apotonick/disposable) is a *non-persistent* object provided by **Disposable** gem and is a building block of Reform and other gems.

### Workflow
* Often used to refer to the internal flow of the operation or application.
* [Commercial gem](#workflow) from Trailblazer, that speeds up implementation of business processes.

### Uber
[Uber](https://github.com/apotonick/uber) gem is part of TRB ecosystem and provides building blocks for many gems.
