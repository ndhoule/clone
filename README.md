# clone [![CI][ci-badge]][ci-link]

Deeply clones a source object.

## Installation

```sh
$ npm install @ndhoule/clone
```

## API

### `clone(target : *)` => *

Deeply copies an input object.

```javascript
var a = { a: 1 };
var cloned = clone(a);

console.log(cloned); //=> { a: 1 }
console.log(cloned === a); //=> false
```

## Acknowledgements

Based on [component/clone](https://github.com/component/clone).

## License

Released under the [MIT license](LICENSE.md).

[ci-link]: https://travis-ci.org/ndhoule/clone
[ci-badge]: https://travis-ci.org/ndhoule/clone.svg?branch=master
