import pandas as pd

events = pd.read_csv('data_for_assignment_2/events.csv')
campaigns = pd.read_csv('data_for_assignment_2/campaigns.csv')
messages = pd.read_csv('data_for_assignment_2/messages.csv')
client_first_purchase = pd.read_csv('data_for_assignment_2/client_first_purchase_date.csv')
friends = pd.read_csv('data_for_assignment_2/friends.csv')


messages['client_id'] = messages['client_id'].apply(lambda x: x.strip())

events['event_time'] = pd.to_datetime(events['event_time'])
campaigns['started_at'] = pd.to_datetime(campaigns['started_at'])
campaigns['finished_at'] = pd.to_datetime(campaigns['finished_at'])
messages['sent_at'] = pd.to_datetime(messages['sent_at'])


messages = messages.drop_duplicates()
messages = messages.dropna(subset=['client_id', 'campaign_id'])

events.to_csv('output/clean_events.csv', index=False)
campaigns.to_csv('output/clean_campaigns.csv', index=False)
messages.to_csv('output/clean_messages.csv', index=False)
client_first_purchase.to_csv('output/clean_client_first_purchase.csv', index=False)
friends.to_csv('output/clean_friends.csv', index=False)
