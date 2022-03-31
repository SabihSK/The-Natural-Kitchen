require('vue-full-calendar');

Object.defineProperty(Vue.prototype, '$FullCalendar', { value: FullCalendar });
Vue.use(FullCalendar)
