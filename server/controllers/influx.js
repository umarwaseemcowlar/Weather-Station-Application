import { Point } from "@influxdata/influxdb-client";
import { InfluxDB } from "@influxdata/influxdb-client";
import dotenv from 'dotenv';

class InfluxController {

    constructor() {
        dotenv.config();

        const TOKEN = process.env.INFLUX_DB_TOKEN;
        const URL = process.env.INFLUX_URL;
        const ORG = process.env.INFLUX_ORG;
        const BUCKET = process.env.INFLUX_BUCKET;

        const CLIENT = new InfluxDB({ url: URL, token: TOKEN });

        this.writeClient = CLIENT.getWriteApi(ORG, BUCKET);

        this.queryClient = CLIENT.getQueryApi(ORG);
    }

    // write point
    async writePoint(measurement, tags, fields) {
        try {
            const point = new Point(measurement)
                .tag(tags)
                .floatField("value", fields);
            this.writeClient.writePoint(point);
            // this.writeClient.flush();
            // this.writeClient.close();
            console.log(`Point ${point.toLineProtocol()} written successfully!`);
        } catch (error) {
            console.log(error);
        }
    }

    // query data
    async queryData(query) {
        try {
            const results = []
            this.queryClient.queryRaw(query).then((result) => {
                result.split("\r\n").forEach((line) => {
                    if (line.startsWith("#")) {
                        console.log(`HEADERS: ${line}`);
                    } else {
                        console.log(`RESULT: ${line}`);
                        results.push(line);
                    }
                })
            })
            return results;
        } catch (error) {
            console.log(error);
        }
    }
}

export default InfluxController;