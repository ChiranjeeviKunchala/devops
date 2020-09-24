SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS spring-web-project;
CREATE SCHEMA `spring-web-project`;
USE `spring-web-project`;

--
-- Table structure for table `user`
--

CREATE TABLE user (
  user_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  username VARCHAR(150) NOT NULL UNIQUE,
  password VARCHAR(32) NOT NULL,
  email VARCHAR(255) DEFAULT NULL UNIQUE,
  picture LONGBLOB DEFAULT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  password_expired BOOLEAN NOT NULL DEFAULT TRUE,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `role`
--

CREATE TABLE role (
  role_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(64) NOT NULL,
  description TEXT DEFAULT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (role_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `user_role`
--

CREATE TABLE user_role (
  user_id BIGINT UNSIGNED NOT NULL,
  role_id BIGINT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id , role_id),
  CONSTRAINT user_role_user FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT user_role_role FOREIGN KEY (role_id) REFERENCES role (role_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Administration User for the schema `spring-web-project`
--

DROP USER IF EXISTS 'spring-web-project'@'localhost';
CREATE USER 'spring-web-project'@'localhost' IDENTIFIED BY 'spring-web-project' PASSWORD EXPIRE NEVER;
GRANT ALL ON `spring-web-project`.* TO 'spring-web-project'@'localhost';
GRANT SELECT, INSERT ON `spring-web-project`.* TO 'spring-web-project'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;