module.exports = {
  install: function(Vue, options) {
    Vue.component('foo', require('@components/Foo'));
    Vue.component('bar', require('@components/Bar'));
  }
};
