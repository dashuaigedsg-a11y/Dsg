app_name = "dsg_wholesale"
app_title = "日化百货批发"
app_publisher = "Dsg"
app_description = "ERPNext 日化百货批发业务扩展"
app_email = ""
app_license = "MIT"

# Keep custom business logic isolated from ERPNext core.
doc_events = {}

fixtures = [
    {"dt": "Custom Field", "filters": [["module", "=", "Dsg Wholesale"]]},
]
