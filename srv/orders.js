const cds = require('@sap/cds');
const { Orders } = cds.entities("com.training");

module.exports = ( srv ) => {
    srv.before("*", async (req) => {
        console.log(`Method: ${req.Method}`);
        console.log(`Method: ${req.Target}`);
    }
    )
};

// //READ
// srv.on("READ", "Orders", async (req) => {
//     if (req.data.ClientEmail !== undefined) {
//         return await SELECT.from`com.training.Orders`
//             .where`ClientEmail = ${req.data.ClientEmail}`;
//     }
//     return await SELECT.from(Orders);
// });

// srv.after('READ', "Orders", (data) => {
//     return data.map((order) => (order.Reviewed = true));
// }
// );

// //CREATE
// srv.on('CREATE', "Orders", async (req) => {
//     let returnData = await cds
//         .transaction(req)
//         .run(
//             INSERT.into(Orders).entries({
//                 ClientEmail: req.data.ClientEmail,
//                 FirstName: req.data.FirstName,
//                 LastName: req.data.LastName,
//                 CreatedOn: req.data.CreatedOn,
//                 Reviewed: req.data.Reviewed,
//                 Approved: req.data.Approved,
//             })
//         )
//         .then((resolve, reject) => {
//             console.log("Resolve", resolve);
//             console.log("Reject", reject);

//             if (typeof resolve !== "undefined") {
//                 return req.data;
//             } else {
//                 req.error(409, "Record not Inserted");
//             }
//         })
//         .catch((err) => {
//             console.log(err);
//             req.error(err.code, err.message);
//         });
//     console.log("Before End", returnData);
//     return returnData;
// });

// //UPDATE
// srv.on("UPDATE", "Orders", async (req) => {
//     let returnData = await cds
//         .transaction(req)
//         .run([
//             UPDATE(Orders, req.data.ClientEmail).set({
//                 FirstName: req.data.FirstName,
//                 LastName: req.data.LastName,
//             }),
//         ])
//         .then((resolve, reject) => {
//             console.log("Resolve", resolve);
//             console.log("Reject", reject);

//             if (resolve[0] == 0) {
//                 req.error(409, "Record not Found");
//             }
//         })
//         .catch((err) => {
//             console.log(err);
//             req.error(err.code, err.message);
//         });
//     console.log("Before End", returnData);
//     return returnData;
// });

// //DELETE
// srv.on("DELETE", "Orders", async (req) => {
//     let returnData = await cds
//         .transaction(req)
//         .run(
//             DELETE.from(Orders).where({
//                 ClientEmail: req.data.ClientEmail,
//             })
//         )
//         .then((resolve, reject) => {
//             console.log("Resolve", resolve);
//             console.log("Reject", reject);

//             if (resolve !== 1) {
//                 req.error(409, "Record not Found");
//             }
//         })
//         .catch((err) => {
//             console.log(err);
//             req.error(err.code, err.message);
//         });
//     console.log("Before End", returnData);
//     return await returnData;
// });

//FUNCTION
srv.on("getClientTaxRate", async (req) => {
    //NO Server Side-effect
    const { ClientEmail } = req.data;
    const db = srv.transaction(req);
    const results = await db
        .read(Orders, ["Country_code"])
        .where({ ClientEmail: ClientEmail });

    switch (results[0].Country_code) {
        case "ES":
            return 21.5;
        case "UK":
            return 24.6;
        default:
            break;
    }
});