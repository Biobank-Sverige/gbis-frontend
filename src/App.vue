<template>
    <div id="app">
        <div>List of samples from backend server using GBIS 3.0</div>
        <SampleList v-if="loaded" :samples="samples"></SampleList>
    </div>
</template>

<script>
    import axios from 'axios'
    import SampleList from './components/SampleList'

    export default {
        name: 'App',
        components: {
            SampleList
        },
        data: () => ({
            loaded: false,
            samples: null,
        }),
        async mounted() {
            this.loaded = false;
            const path = 'http://localhost:8080';
            axios.get(path)
                .then((res) => {
                    console.log(res);
                    this.samples = res.data;
                    this.loaded = true;
                })
                .catch((error) => {
                    // eslint-disable-next-line
                    console.error(error);
                });
        }
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
