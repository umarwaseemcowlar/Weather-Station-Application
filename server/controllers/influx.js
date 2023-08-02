import { Point } from "@influxdata/influxdb-client";
import { writeClient, queryApi } from "./influx_db_config.js";

class InfluxController {

    // write point
    static async writePoint(measurement, tags, fields) {
        const point = new Point(measurement)
            .tag(tags)
            .floatField(fields)
        writeClient.writePoint(point);
    }

    // query data
    static async queryData(query) {
        const queryResult = queryApi.queryRows(query);
        const points = [];
        for await (const row of queryResult) {
            points.push(row);
        }
        return points;
    }
}

export default InfluxController;