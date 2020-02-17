<template>
    <div>
        <table>
            <thead>
            <tr>
                <td>Sample id</td>
                <td>Sample study id</td>
                <td>Sample usage</td>
                <td>Last usage date</td>
                <td>Donor</td>
                <td>Parent sample id</td>
                <td>Material type</td>
                <td>Sample volume</td>
                <td>Freeze/Thaw cycles</td>
                <td>Plate id</td>
                <td>Position in plate</td>
            </tr>
            </thead>
        <tr v-for="sample in samples" v-bind:key="sample.sample_id">
            <td>{{sample.sample_id}}</td>
            <td>{{sample.study_id}}</td>
            <td>{{sample.sample_usage}}</td>
            <td>{{sample.last_usage_date}}</td>
            <td>{{sample.donor}}</td>
            <td>{{sample.parent_sample_id}}</td>
            <td>{{sample.material_type}}</td>
            <td>{{sample.sample_volume}}</td>
            <td>{{sample.freeze_thaw_cycles}}</td>
            <td>{{sample.sample_plate_id}}</td>
            <td>{{sample.sample_plate_position}}</td>

        </tr>
        </table>
    </div>
</template>

<script>
    export default {
        props: ['samples']
    }
</script>