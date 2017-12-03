<template>
  <div class="foo">
    Hello Foo {{msg}}
  </div>
</template>

<script>
export default {
  name: "Foo",
  introduction: "displaoy message.",
  description: `
    This is amazing component.
  `
  token: "<foo msg='ALL OK'></foo>",
  props: {
    msg: {
      type: String,
      required: true,
      note: 'message'
    }
  }
};
</script>

<style>
.foo {
  color: blue;
}
</style>
