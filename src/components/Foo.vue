<template>
  <div class="foo">
    Hello Foo {{msg}}
  </div>
</template>

<script>
export default {
  props: {
    msg: {
      type: String,
      required: true
    }
  }
};
</script>

<style>
.foo {
  color: blue;
}
</style>
