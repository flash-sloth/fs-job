/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1-123456
 Source Server Type    : MySQL
 Source Server Version : 80020 (8.0.20)
 Source Host           : 127.0.0.1:3306
 Source Schema         : powerjob-daily-v5

 Target Server Type    : MySQL
 Target Server Version : 80020 (8.0.20)
 File Encoding         : 65001

 Date: 22/06/2024 11:00:00
*/


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_info
-- ----------------------------
DROP TABLE IF EXISTS `app_info`;
CREATE TABLE `app_info`  (
                             `id` bigint NOT NULL AUTO_INCREMENT,
                             `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `current_server` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `gmt_create` datetime(6) NULL DEFAULT NULL,
                             `gmt_modified` datetime(6) NULL DEFAULT NULL,
                             `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             PRIMARY KEY (`id`) USING BTREE,
                             UNIQUE INDEX `uidx01_app_info`(`app_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_info
-- ----------------------------

-- ----------------------------
-- Table structure for container_info
-- ----------------------------
DROP TABLE IF EXISTS `container_info`;
CREATE TABLE `container_info`  (
                                   `id` bigint NOT NULL AUTO_INCREMENT,
                                   `app_id` bigint NULL DEFAULT NULL,
                                   `container_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   `gmt_create` datetime(6) NULL DEFAULT NULL,
                                   `gmt_modified` datetime(6) NULL DEFAULT NULL,
                                   `last_deploy_time` datetime(6) NULL DEFAULT NULL,
                                   `source_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   `source_type` int NULL DEFAULT NULL,
                                   `status` int NULL DEFAULT NULL,
                                   `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`) USING BTREE,
                                   INDEX `idx01_container_info`(`app_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of container_info
-- ----------------------------

-- ----------------------------
-- Table structure for instance_info
-- ----------------------------
DROP TABLE IF EXISTS `instance_info`;
CREATE TABLE `instance_info`  (
                                  `id` bigint NOT NULL AUTO_INCREMENT,
                                  `actual_trigger_time` bigint NULL DEFAULT NULL,
                                  `app_id` bigint NULL DEFAULT NULL,
                                  `expected_trigger_time` bigint NULL DEFAULT NULL,
                                  `finished_time` bigint NULL DEFAULT NULL,
                                  `gmt_create` datetime(6) NULL DEFAULT NULL,
                                  `gmt_modified` datetime(6) NULL DEFAULT NULL,
                                  `instance_id` bigint NULL DEFAULT NULL,
                                  `instance_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                  `job_id` bigint NULL DEFAULT NULL,
                                  `job_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                  `last_report_time` bigint NULL DEFAULT NULL,
                                  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                  `running_times` bigint NULL DEFAULT NULL,
                                  `status` int NULL DEFAULT NULL,
                                  `task_tracker_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `type` int NULL DEFAULT NULL,
                                  `wf_instance_id` bigint NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`) USING BTREE,
                                  INDEX `idx01_instance_info`(`job_id` ASC, `status` ASC) USING BTREE,
                                  INDEX `idx02_instance_info`(`app_id` ASC, `status` ASC) USING BTREE,
                                  INDEX `idx03_instance_info`(`instance_id` ASC, `status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of instance_info
-- ----------------------------

-- ----------------------------
-- Table structure for job_info
-- ----------------------------
DROP TABLE IF EXISTS `job_info`;
CREATE TABLE `job_info`  (
                             `id` bigint NOT NULL AUTO_INCREMENT,
                             `advanced_runtime_config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `alarm_config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `app_id` bigint NULL DEFAULT NULL,
                             `concurrency` int NULL DEFAULT NULL,
                             `designated_workers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `dispatch_strategy` int NULL DEFAULT NULL,
                             `dispatch_strategy_config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `execute_type` int NULL DEFAULT NULL,
                             `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `gmt_create` datetime(6) NULL DEFAULT NULL,
                             `gmt_modified` datetime(6) NULL DEFAULT NULL,
                             `instance_retry_num` int NULL DEFAULT NULL,
                             `instance_time_limit` bigint NULL DEFAULT NULL,
                             `job_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `job_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                             `lifecycle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `log_config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `max_instance_num` int NULL DEFAULT NULL,
                             `max_worker_count` int NULL DEFAULT NULL,
                             `min_cpu_cores` double NOT NULL,
                             `min_disk_space` double NOT NULL,
                             `min_memory_space` double NOT NULL,
                             `next_trigger_time` bigint NULL DEFAULT NULL,
                             `notify_user_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `processor_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `processor_type` int NULL DEFAULT NULL,
                             `status` int NULL DEFAULT NULL,
                             `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `task_retry_num` int NULL DEFAULT NULL,
                             `time_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `time_expression_type` int NULL DEFAULT NULL,
                             PRIMARY KEY (`id`) USING BTREE,
                             INDEX `idx01_job_info`(`app_id` ASC, `status` ASC, `time_expression_type` ASC, `next_trigger_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_info
-- ----------------------------

-- ----------------------------
-- Table structure for oms_lock
-- ----------------------------
DROP TABLE IF EXISTS `oms_lock`;
CREATE TABLE `oms_lock`  (
                             `id` bigint NOT NULL AUTO_INCREMENT,
                             `gmt_create` datetime(6) NULL DEFAULT NULL,
                             `gmt_modified` datetime(6) NULL DEFAULT NULL,
                             `lock_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `max_lock_time` bigint NULL DEFAULT NULL,
                             `ownerip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             PRIMARY KEY (`id`) USING BTREE,
                             UNIQUE INDEX `uidx01_oms_lock`(`lock_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_lock
-- ----------------------------

-- ----------------------------
-- Table structure for server_info
-- ----------------------------
DROP TABLE IF EXISTS `server_info`;
CREATE TABLE `server_info`  (
                                `id` bigint NOT NULL AUTO_INCREMENT,
                                `gmt_create` datetime(6) NULL DEFAULT NULL,
                                `gmt_modified` datetime(6) NULL DEFAULT NULL,
                                `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                PRIMARY KEY (`id`) USING BTREE,
                                UNIQUE INDEX `uidx01_server_info`(`ip` ASC) USING BTREE,
                                INDEX `idx01_server_info`(`gmt_modified` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of server_info
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
                              `id` bigint NOT NULL AUTO_INCREMENT,
                              `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `gmt_create` datetime(6) NULL DEFAULT NULL,
                              `gmt_modified` datetime(6) NULL DEFAULT NULL,
                              `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              `web_hook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                              PRIMARY KEY (`id`) USING BTREE,
                              INDEX `uidx01_user_info`(`username` ASC) USING BTREE,
                              INDEX `uidx02_user_info`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------

-- ----------------------------
-- Table structure for workflow_info
-- ----------------------------
DROP TABLE IF EXISTS `workflow_info`;
CREATE TABLE `workflow_info`  (
                                  `id` bigint NOT NULL AUTO_INCREMENT,
                                  `app_id` bigint NULL DEFAULT NULL,
                                  `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `gmt_create` datetime(6) NULL DEFAULT NULL,
                                  `gmt_modified` datetime(6) NULL DEFAULT NULL,
                                  `lifecycle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `max_wf_instance_num` int NULL DEFAULT NULL,
                                  `next_trigger_time` bigint NULL DEFAULT NULL,
                                  `notify_user_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `pedag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                  `status` int NULL DEFAULT NULL,
                                  `time_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `time_expression_type` int NULL DEFAULT NULL,
                                  `wf_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  `wf_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`) USING BTREE,
                                  INDEX `idx01_workflow_info`(`app_id` ASC, `status` ASC, `time_expression_type` ASC, `next_trigger_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_info
-- ----------------------------

-- ----------------------------
-- Table structure for workflow_instance_info
-- ----------------------------
DROP TABLE IF EXISTS `workflow_instance_info`;
CREATE TABLE `workflow_instance_info`  (
                                           `id` bigint NOT NULL AUTO_INCREMENT,
                                           `actual_trigger_time` bigint NULL DEFAULT NULL,
                                           `app_id` bigint NULL DEFAULT NULL,
                                           `dag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                           `expected_trigger_time` bigint NULL DEFAULT NULL,
                                           `finished_time` bigint NULL DEFAULT NULL,
                                           `gmt_create` datetime(6) NULL DEFAULT NULL,
                                           `gmt_modified` datetime(6) NULL DEFAULT NULL,
                                           `parent_wf_instance_id` bigint NULL DEFAULT NULL,
                                           `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                           `status` int NULL DEFAULT NULL,
                                           `wf_context` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                           `wf_init_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                           `wf_instance_id` bigint NULL DEFAULT NULL,
                                           `workflow_id` bigint NULL DEFAULT NULL,
                                           PRIMARY KEY (`id`) USING BTREE,
                                           UNIQUE INDEX `uidx01_wf_instance`(`wf_instance_id` ASC) USING BTREE,
                                           INDEX `idx01_wf_instance`(`workflow_id` ASC, `status` ASC, `app_id` ASC, `expected_trigger_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_instance_info
-- ----------------------------

-- ----------------------------
-- Table structure for workflow_node_info
-- ----------------------------
DROP TABLE IF EXISTS `workflow_node_info`;
CREATE TABLE `workflow_node_info`  (
                                       `id` bigint NOT NULL AUTO_INCREMENT,
                                       `app_id` bigint NOT NULL,
                                       `enable` bit(1) NOT NULL,
                                       `extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                       `gmt_create` datetime(6) NOT NULL,
                                       `gmt_modified` datetime(6) NOT NULL,
                                       `job_id` bigint NULL DEFAULT NULL,
                                       `node_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                       `node_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                       `skip_when_failed` bit(1) NOT NULL,
                                       `type` int NULL DEFAULT NULL,
                                       `workflow_id` bigint NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`) USING BTREE,
                                       INDEX `idx01_workflow_node_info`(`workflow_id` ASC, `gmt_create` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_node_info
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

