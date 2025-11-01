import os
import yaml

def load_env(env="dev"):
    """
    Load environment-specific configuration from YAML files.
    Example in Robot: ${config}=    Load Env    qa
    """
    config_path = os.path.join(os.path.dirname(__file__), f"../config/{env}_variables.yaml")
    config_path = os.path.abspath(config_path)

    if not os.path.exists(config_path):
        raise FileNotFoundError(f"Environment file not found: {config_path}")

    with open(config_path, "r", encoding="utf-8") as f:
        config = yaml.safe_load(f)

    print(f"✅ Loaded environment: {env}")
    return config