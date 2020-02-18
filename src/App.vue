<template>
    <div id="app">
        <div>List of samples from backend server using GBIS 3.0</div>
        <SampleList v-if="loaded" :samples="samples"></SampleList>
        <div style="width:600px;height: 600px;">
            <SampleGraph v-if="loaded" :chartdata="chartData"></SampleGraph>
        </div>
    </div>
</template>

<script>
    import axios from 'axios'
    import SampleList from './components/SampleList'
    import SampleGraph from "./components/SampleGraph";

    export default {
        name: 'App',
        components: {
            SampleList,
            SampleGraph
        },
        data: () => ({
            loaded: false,
            samples: null,
            chartData: null
        }),
        async mounted() {
            this.loaded = false;
            const path = 'http://localhost:8080';
            axios.get(path)
                .then((res) => {
                    console.log(res);
                    this.samples = res.data;
                    this.chartData = {
                        datasets: [{
                            label: "Samples collected per day",
                            data: samplesPerDay(res.data)
                        }]
                    };
                    this.loaded = true;
                })
                .catch((error) => {
                    // eslint-disable-next-line
                    console.error(error);
                });
        }
    }

    function samplesPerDay(samples) {
        var counts = {};
        samples.forEach(function (x) {
            counts[x.sample_taken_date] = (counts[x.sample_taken_date] || 0) + 1;
        });

        return Object.keys(counts).map(function (key) {
            return {"x": key, "y": counts[key]}
        });
    }
</script>

<style>
    #app {
        font-family: Avenir, Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
        color: #2c3e50;
        margin-top: 60px;
    }
</style>
