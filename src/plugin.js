module.exports = {
  install: function(Vue, options) {
    Vue.component('my-foo', require('@components/Foo'));
    Vue.component('my-bar', require('@components/Bar'));
  }
};
