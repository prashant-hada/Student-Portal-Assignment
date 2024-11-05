import prisma from "../DB/config.js";

 export const registerUser = async(req, res)=>{
    try 
    {
        const {title, firstName, middleName, lastName, mobileNo, emergencyNo, maritalStatus, gender} = req.body; 
        let {dob} = req.body;
        dob = new Date(dob);

        const findUser = await prisma .student.findUnique({
            where:{
                email:email
            }
        })

        if(findUser)return res.status(409).json({message:"User already exists with this email"})

        
        const createUser = await prisma.student.create({
            data:
            {
                title, 
                firstName, 
                middleName, 
                lastName, 
                mobileNo, 
                emergencyNo, 
                maritalStatus, 
                gender, 
                dob
            }
        })

        return res.status(201).json({message:"user registered in DB", data:createUser})
           
    } 
    catch (error) {
       console.log(error);
       return res.status(400).json({message: "An error occurred while registering the user", error: error.message}); 
    }
}