<template>
    <div>
        <b-table striped hover :items="samples" :fields="fields"></b-table>
    </div>
</template>

<script>
    import 'bootstrap/dist/css/bootstrap.css'
    import 'bootstrap-vue/dist/bootstrap-vue.css'

    import Vue from 'vue'
    import {BootstrapVue, IconsPlugin} from 'bootstrap-vue'

    Vue.use(BootstrapVue);
    Vue.use(IconsPlugin);
    export default {
        props: ['samples'],
        data: () => {
            return {
                fields: [
                    {key: 'sample_id', sortable: true},
                    {key: 'study_id', sortable: true},
                    {key: 'sample_usage', sortable: true},
                    {key: 'last_usage_date', sortable: true},
                    {key: 'donor', sortable: true},
                    {key: 'parent_sample_id', sortable: true},
                    {key: 'material_type', sortable: true},
                    {key: 'sample_volume', sortable: true},
                    {key: 'freeze_thaw_cycles', sortable: true},
                    {key: 'sample_plate_id', sortable: true},
                    {key: 'sample_plate_position', sortable: true}
                ],

            }
        }
    }
</script>