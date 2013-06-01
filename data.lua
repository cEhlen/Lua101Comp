return {
    name = "101Company",
    departments = {
        {
            name = "Dep 1",
            manager = {
                name = "Manager Dep 1",
                adress = "Foo Bar",
                salary = 10,
                
            },
            employees = {
                {
                    name = "Employee Dep 1 1",
                    adress = "Foo bar 2",
                    salary = 25,
                },
                {
                    name = "Employee Dep 1 2",
                    adress = "Bar",
                    salary = 20,
                },
            },
            departments = {
                name = "Dep 1.1",
                manager = { 
                    name = "Manager Dep 1.1",
                    adress = "Baz",
                    salary = 15
                },
                employees = {
                    {
                        name = "Employee Dep 1.1 1",
                        adress = "Home",
                        salary = 17,
                    },
                },
            },
        },
    },
}