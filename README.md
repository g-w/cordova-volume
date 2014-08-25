Cordova Volume Plugin
==================================

## Usage

The plugin exposes one method
`window.plugin.volume.getVolume(callback)`. This methods retrives the
current volume and passes it to the callback. Example:

```
window.plugin.getVolume(function(volume) {
  alert("The current volume is " + volume);
});
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
