import Vue from 'vue';
import VCalendar from 'v-calendar';

// Use v-calendar, v-date-picker & v-popover components
Vue.use(VCalendar, {
    firstDayOfWeek: 2,  // Monday
});

export default {
    data() {
        return {
            selectedValue: new Date(),
        };
    },
};
