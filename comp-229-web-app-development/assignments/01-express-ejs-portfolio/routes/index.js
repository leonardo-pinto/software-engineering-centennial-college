var express = require("express");
var router = express.Router();

// Author: Leonardo Pinto
// StudentID: 301299256

/* GET home page. */
router.get("/", function (_req, res, _next) {
  res.render("home", { title: "Home" });
});

/* GET about page. */
router.get("/about", function (_req, res, _next) {
  res.render("about", { title: "About" });
});

/* GET projects page. */
router.get("/projects", function (_req, res, _next) {
  const projects = [
    {
      title: "Investment Manager",
      description: "Full Stack App to manage investments in USA and Brazil",
      stacks: [
        "TypeScript",
        "Vue.js",
        "C#",
        "ASP.NET",
        "Entity Framework",
        "Docker",
      ],
      image: "/images/investment-manager.png",
      projectUrl: "https://github.com/leonardo-pinto/investment-manager",
    },
    {
      title: "Library Management System",
      description: "Back-end app to manage a library system",
      stacks: [
        "TypeScript",
        "Node.js",
        "Express.js",
        "Docker",
        "Sequelize ORM",
      ],
      image: "/images/library-ms.png",
      projectUrl: "https://github.com/leonardo-pinto/api-express-sequelize",
    },
    {
      title: "E-Commerce Microservices",
      description:
        "Back-end E-Commerce app using microservices, RabbitMQ, and AWS",
      stacks: [
        "TypeScript",
        "Node.js",
        "Nest.js",
        "Mongoose",
        "RabbitMQ",
        "AWS",
      ],
      image: "/images/ecommerce.png",
      projectUrl: "https://github.com/leonardo-pinto/ecommerce-microservices",
    },
  ];

  res.render("projects", { title: "Projects", projects });
});

/* GET services page. */
router.get("/services", function (_req, res, _next) {
  const services = ["Web Development", "APIs", "Quality Assurance"];

  res.render("services", { title: "Services", services });
});

/* GET contact page. */
router.get("/contact", function (_req, res, _next) {
  res.render("contact", { title: "Contact" });
});

module.exports = router;
