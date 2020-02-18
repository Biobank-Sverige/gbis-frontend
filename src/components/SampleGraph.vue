<script>
    import { Line } from 'vue-chartjs'

    export default {
        extends: Line,
        props: {
            chartdata: {
                type: Object,
                default: null
            },
        },
        data: ()=>({
            options : {
                scales: {
                    xAxes: [{
                        type: 'time',
                        time: {
                            unit: 'day'
                        }
                    }]
                }
            }
        }),
        mounted () {
            this.renderChart(this.chartdata, this.options)
        }
    }
</script>

<style>
</style>