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
	VALUES ('CyberDefense', 1);

-- Fast Test
INSERT INTO secure.tasks(
	project_id, title, description, task_type_id, parameters)
	VALUES (1,
			'Fast Test',
			'',
			1,
			'{"collection_site":"ripe","date_start":"20050525","time_start":"0000","date_end":"20050525","time_end":"2359","anomalous_date_start":"20050525","anomalous_time_start":"0400","anomalous_date_end":"20050525","anomalous_time_end":"0759","data_partition_training":60,"data_partition_testing":40,"rnn_length":"20","cache":"activated","debug":"activated"}'
			);

-- Moscow Blackout
INSERT INTO secure.tasks(
	project_id, title, description, task_type_id, parameters)
	VALUES (1,
			'Moscow blackout experiment',
			'',
			1,
			'{"collection_site":"ripe","date_start":"20050523","time_start":"0000","date_end":"20050527","time_end":"2359","anomalous_date_start":"20050525","anomalous_time_start":"0400","anomalous_date_end":"20050525","anomalous_time_end":"0759","data_partition_training":60,"data_partition_testing":40,"rnn_length":"20","cache":"activated","debug":"activated"}'
			);


-- Pakistan Power Outage
INSERT INTO secure.tasks(
	project_id, title, description, task_type_id, parameters)
	VALUES (1,
			'Pakistan Power Outage  experiment',
			'',
			1,
			'{"collection_site":"ripe","date_start":"20210107","time_start":"0000","date_end":"20210111","time_end":"2359","anomalous_date_start":"20210109","anomalous_time_start":"1840","anomalous_date_end":"20210109","anomalous_time_end":"2359","data_partition_training":60,"data_partition_testing":40,"rnn_length":"20","cache":"activated","debug":"activated"}'
			);

-- Slammer attack
INSERT INTO secure.tasks(
	project_id, title, description, task_type_id, parameters)
	VALUES (1,
			'Slammer attack  experiment',
			'',
			1,
			'{"collection_site":"ripe","date_start":"20030123","time_start":"0000","date_end":"20030127","time_end":"2359","anomalous_date_start":"20030125","anomalous_time_start":"0531","anomalous_date_end":"20030125","anomalous_time_end":"1959","data_partition_training":60,"data_partition_testing":40,"rnn_length":"20","cache":"activated","debug":"activated"}'
			);