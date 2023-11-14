INSERT INTO secure.users(
	first_name, last_name, email, pass, role)
	VALUES ('Luiz', 'Oliveira', 'luizsoliveira@gmail.com', '123456', 'app_user');

INSERT INTO secure.users(
	first_name, last_name, email, pass, role)
	VALUES ('Ljiljana', 'Trajkovic', 'ljilja@cs.sfu.ca', '123456', 'app_user');

INSERT INTO secure.task_types(
	title, slug)
	VALUES ('BGP anomaly', 'BGPAnomaly');

INSERT INTO secure.projects(
	title, manager_user_id)
	VALUES ('BGP anomaly', 1);

-- Fast Test
INSERT INTO secure.tasks(
	project_id, title, description, task_type_id, parameters)
	VALUES (1,
			'FastTest-RIPE-RRC04',
			'Fast Test RIPE RRC04',
			1,
			'{"collection_site":"ripe","ripe_ris_rrc":4,"date_start":"20050525","date_end":"20050525","anomalous_date_start":"20050525","anomalous_time_start":"0400","anomalous_date_end":"20050525","anomalous_time_end":"0759","cache":"activated","debug":"activated"}'
			);

-- Moscow Blackout
INSERT INTO secure.tasks(
	project_id, title, description, task_type_id, parameters)
	VALUES (1,
			'Moscow-RIPE-RRC04',
			'Moscow blackout RIPE RRC04',
			1,
			-- '{"collection_site":"ripe","date_start":"20050523","time_start":"0000","date_end":"20050527","time_end":"2359","anomalous_date_start":"20050525","anomalous_time_start":"0400","anomalous_date_end":"20050525","anomalous_time_end":"0759","data_partition_training":60,"data_partition_testing":40,"rnn_length":"20","cache":"activated","debug":"activated"}'
			'{"collection_site":"ripe","ripe_ris_rrc":4,"date_start":"20050523","date_end":"20050527","anomalous_date_start":"20050525","anomalous_time_start":"0400","anomalous_date_end":"20050525","anomalous_time_end":"0759","cache":"activated","debug":"activated"}'
			);


-- Pakistan Power Outage
INSERT INTO secure.tasks(
	project_id, title, description, task_type_id, parameters)
	VALUES (1,
			'Pakistan-RIPE-RRC04',
			'Pakistan Power Outage RIPE RRC04',
			1,
			-- '{"collection_site":"ripe","date_start":"20210107","time_start":"0000","date_end":"20210111","time_end":"2359","anomalous_date_start":"20210109","anomalous_time_start":"1840","anomalous_date_end":"20210109","anomalous_time_end":"2359","data_partition_training":60,"data_partition_testing":40,"rnn_length":"20","cache":"activated","debug":"activated"}'
			'{"collection_site":"ripe","ripe_ris_rrc":4,"date_start":"20210107","date_end":"20210111","anomalous_date_start":"20210109","anomalous_time_start":"1840","anomalous_date_end":"20210109","anomalous_time_end":"2359","cache":"activated","debug":"activated"}'
			);

-- Slammer attack
INSERT INTO secure.tasks(
	project_id, title, description, task_type_id, parameters)
	VALUES (1,
			'Slammer-RIPE-RRC04',
			'Slammer attack RIPE RRC04',
			1,
			-- '{"collection_site":"ripe","date_start":"20030123","time_start":"0000","date_end":"20030127","time_end":"2359","anomalous_date_start":"20030125","anomalous_time_start":"0531","anomalous_date_end":"20030125","anomalous_time_end":"1959","data_partition_training":60,"data_partition_testing":40,"rnn_length":"20","cache":"activated","debug":"activated"}'
			'{"collection_site":"ripe","ripe_ris_rrc":4,"date_start":"20030123","time_start":"0000","date_end":"20030127","anomalous_date_start":"20030125","anomalous_time_start":"0531","anomalous_date_end":"20030125","anomalous_time_end":"1959","cache":"activated","debug":"activated"}'
			);