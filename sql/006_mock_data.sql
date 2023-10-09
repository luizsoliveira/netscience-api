INSERT INTO secure.users(
	first_name, last_name, email, pass, role)
	VALUES ('Luiz', 'Oliveira', 'luizsoliveira@gmail.com', '123456', 'app_user');

INSERT INTO secure.task_types(
	title, slug)
	VALUES ('BGP anomaly', 'BGPAnomaly');

INSERT INTO secure.projects(
	title, manager_user_id)
	VALUES ('CyberDefense', 1);

INSERT INTO secure.tasks(
	project_id, title, description, task_type_id, parameters)
	VALUES (1,
			'Event 1',
			'',
			1,
			'{"collection_site":"ripe","date_start":"20050523","time_start":"0000","date_end":"20050527","time_end":"2359","anomalous_date_start":"20050525","anomalous_time_start":"0400","anomalous_date_end":"20050525","anomalous_time_end":"0759","data_partition_training":60,"data_partition_testing":30,"rnn_length":"10","cache":"activated","debug":"activated"}'
			);