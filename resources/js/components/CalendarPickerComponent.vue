<template>
    <div>
        <v-calendar
            is-double-paned>
        </v-calendar>
    </div>

</template>


<script>
    export default {
        data() {
            return {
                selectedValue: new Date(),
            };
        },
    };
</script>

<style scoped>

</style>
