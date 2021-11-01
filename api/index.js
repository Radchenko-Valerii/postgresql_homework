const axios = require("axios").default;

const httpClient = axios.create({ baseURL: "https://randomuser.me/api" });

module.exports.loadUsers = async ()=>{
  const{data: result} = await httpClient.get('/?results=10') ;
  console.log(result);
  return result
}