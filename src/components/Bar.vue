<template>
  <div class="bar">
    Hello Bar {{msg}}
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
.bar {
  color: red;
}
</style>
